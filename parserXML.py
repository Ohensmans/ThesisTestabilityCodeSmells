
import xml.etree.ElementTree as ET
import urllib.request
import pathlib
import os
           
def parse():
    path = ".//.Metrics//"
    t = open(".//Sql Scripts//ProjectQueries.sql", "a", encoding='utf-8')
    t2 = open(".//Sql Scripts//PackageQueries.sql", "a", encoding='utf-8')
    t3 = open(".//Sql Scripts//ClassQueries.sql", "a", encoding='utf-8')
    t4 = open(".//Sql Scripts//MethodQueries.sql", "a", encoding='utf-8')
    id_project = 0
    id_package = 0
    id_class = 0
    id_method = 0
    for f in os.listdir(path):
        if f.endswith(".xml"):
            if not f.endswith("-test.xml"):
                tree = ET.parse(path+f) 
                root = tree.getroot()

                testFileName = os.path.splitext(f)[0]+'-test.xml'
                treeTest = ET.parse(path+testFileName) 
                rootTest = treeTest.getroot()
                
                #projectMetrics
                projectMetrics = root.findall('./Metrics/Metric')
                dictProject = []
                id_project = id_project + 1 
                projectName = os.path.splitext(f)[0]
                tupleProjectId = ('id_project', id_project)
                tupleProjectName = ('projectName', "'"+projectName+"'")
                dictProject.append(tupleProjectId)
                dictProject.append(tupleProjectName)

                query = queryMaker(projectMetrics,dictProject, "PROJECTS")
                t.write(query)

                #packageMetrics
                packages = root.findall('./Packages/Package')

                newId = packageWritter(t2, t3, t4, packages, tupleProjectId, id_package, id_class ,id_method,'', rootTest)
                id_package = newId[0]
                id_class = newId[1]
                id_method = newId[2]
    t.close()
    t2.close()  
    t3.close()  
    t4.close()


def queryMaker(nodes, dictionnary ,tableName):
    #add to a dictionnary the metrics
    for child in nodes:
        tuple = (child.attrib['name'], child.attrib['value'])
        dictionnary.append(tuple)

    #create the query for the sql server
    query = 'INSERT INTO '+tableName+' ('
    for field in dictionnary:
        query= query + field[0] + ','
    
    #remove the last comma
    query = query[:-1]
    query = query + ') VALUES ('

    for field in dictionnary:
        #replace infinite symbol by 9 999 999
        if str(field[1]) == '∞':
            query = query + str(9999999) + ','
        #replace N/A symbol by null
        elif str(field[1]) == 'N/A':
            query = query + 'null,'
        #replace NaN symbol by null
        elif str(field[1]) == 'NaN':
            query = query + str(-9999999) + ','
        else:
            query = query + str(field[1]).replace(",",".") + ','
            
    
    query = query[:-1]
    query = query + '); \n'
    return query

def packageWritter(packageFile, classFile, methodFile, packageNode, tupleProjectId, id_package, id_class ,id_method, parentPackageName, rootTest):
    packageId = id_package
    classId = id_class
    methodId = id_method
    for package in packageNode:
        dictPackage = []
        packageId = packageId + 1 
        tuplePackageId = ('id_package', packageId)

        if parentPackageName == '':
            packageName = package.attrib['name']
        else:
            packageName = parentPackageName+'.'+package.attrib['name']

        tuplePackageName = ('packageName', "'"+packageName+"'")
        dictPackage.append(tupleProjectId)
        dictPackage.append(tuplePackageId)
        dictPackage.append(tuplePackageName)
        packageMetrics = package.findall('./Metrics/Metric')

        query = queryMaker(packageMetrics,dictPackage, "PACKAGES")
        #write the query in the sql file
        packageFile.write(query)

        #classMetrics
        classes = package.findall('./Class')
        for cla in classes:
            dictClass = []
            classId = classId + 1 
            tupleClassId = ('id_class', classId)
            className = cla.attrib['name']
            tupleClassName = ('className', "'"+className+"'")
            dictClass.append(tupleClassId)
            dictClass.append(tuplePackageId)
            dictClass.append(tupleClassName)

            #to add the testablity metrics
            suffixClassName= ""
            tested = matchTestClass(dictClass, rootTest, packageName, className, suffixClassName)
            toFind = tested[1]

            if toFind:
                suffixClassName= "Test"
                tested = matchTestClass(dictClass, rootTest, packageName, className, suffixClassName)
                toFind = tested[1]
            
            if toFind:
                suffixClassName= "Tests"
                tested = matchTestClass(dictClass, rootTest, packageName, className, suffixClassName)
                toFind = tested[1]

            if toFind:
                suffixClassName= "tests"
                tested = matchTestClass(dictClass, rootTest, packageName, className, suffixClassName)
                toFind = tested[1]

            if toFind:
                suffixClassName= "test"
                tested = matchTestClass(dictClass, rootTest, packageName, className, suffixClassName)
                toFind = tested[1]
            
            dictClass = tested[0]

            classMetrics = cla.findall('./Metrics/Metric')

            query = queryMaker(classMetrics,dictClass, "CLASSES")
            #write the query in the sql file
            classFile.write(query)
            
            #methodMetrics
            methods = cla.findall('./Method')
            for method in methods:
                dictMethod = []
                methodId = methodId + 1 
                tupleMethodId = ('id_method', methodId)
                tupleMethodName = ('methodName', "'"+method.attrib['name']+"'")
                dictMethod.append(tupleClassId)
                dictMethod.append(tupleMethodId)
                dictMethod.append(tupleMethodName)
                methodMetrics = method.findall('./Metrics/Metric')

                query = queryMaker(methodMetrics, dictMethod, "METHODS")
                #write the query in the sql file
                methodFile.write(query)
        
        #to get the packages inside the packages
        nestedPackages = package.findall('./Package')
        newId = packageWritter(packageFile, classFile, methodFile, nestedPackages, tupleProjectId, packageId, classId , methodId, packageName, rootTest)
        packageId = newId[0]
        classId = newId[1]
        methodId = newId[2]
    
    result = (packageId, classId , methodId)
    return result

def matchTestClass(dictClass, rootTest, packageName, className, suffixClassName):
    #to add the testablity metrics
    toFind = True
    metricsTest = rootTest.findall('./METRIC')
    for metricTest in metricsTest:
        filter = "[@measured='"+packageName+"."+className+suffixClassName+"']"
        tests = metricTest.findall('./VALUE/'+filter)
        for test in tests:
            tupleTest = (metricTest.attrib['abbreviation'], test.attrib['value'])
            dictClass.append(tupleTest)
            toFind = False
    result = (dictClass, toFind)
    return result
            

def main():
    parse()

if __name__ == "__main__":
    main()