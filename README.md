# ThesisTestabilityCodeSmells
Work related to my thesis about the impacts of Code Smells on testability

# Intellij Plugins used to retrive the project metrics
MetricsTree - https://github.com/b333vv/metricstree \
MetricsReloaded - https://github.com/BasLeijdekkers/MetricsReloaded 

# Commit of new rules for MetricsReloaded
See folder MetricsReloaded to get the version used for the thesis.\
Specific change into the rules on .\MetricsReloaded\utils\src\com\sixrr\metrics\utils\JavaTestUtils.java \
Is now considered an assert call :
* methods starting with "assert"
* methods starting with "verify"
* methods starting with "andExpect"
* methods starting with "expect"
* methods named "andReturn"
* methods named "then"
* methods named "fail"

The librairies accepted for unit testing are:
* junit.framework.TestCase
* junit.jupiter.api.Assertions
* mockito.Mockito
* junit.jupiter.params

# Analysed projects 
Date of retrieval : 3/30/2023
|Name|Description|Uri|
|:----|:----|:----|
|iluwatar/java-design-patterns|Design patterns implemented in Java|https://github.com/iluwatar/java-design-patterns|
|spring-projects/spring-boot|Spring Boot|https://github.com/spring-projects/spring-boot|
|elastic/elasticsearch|Free and Open, Distributed, RESTful Search Engine|https://github.com/elastic/elasticsearch|
|spring-projects/spring-framework|Spring Framework|https://github.com/spring-projects/spring-framework|
|TheAlgorithms/Java|All Algorithms implemented in Java|https://github.com/TheAlgorithms/Java|
|ReactiveX/RxJava|RxJava – Reactive Extensions for the JVM – a library for composing asynchronous and event-based programs using observ…|https://github.com/ReactiveX/RxJava|
|square/retrofit|A type-safe HTTP client for Android and the JVM|https://github.com/square/retrofit|
|apache/dubbo|Apache Dubbo is a high-performance, java based, open source RPC framework.|https://github.com/apache/dubbo|
|PhilJay/MPAndroidChart|A powerful 🚀 Android chart view / graph view library, supporting line- bar- pie- radar- bubble- and candlestick chart|https://github.com/PhilJay/MPAndroidChart|
|skylot/jadx|Dex to Java decompiler|https://github.com/skylot/jadx|
|airbnb/lottie-android|Render After Effects animations natively on Android and iOS, Web, and React Native|https://github.com/airbnb/lottie-android|
|bumptech/glide|An image loading and caching library for Android focused on smooth scrolling|https://github.com/bumptech/glide|
|alibaba/arthas|Alibaba Java Diagnostic Tool Arthas/Alibaba Java诊断利器Arthas|https://github.com/alibaba/arthas|
|netty/netty|Netty project - an event-driven asynchronous network application framework|https://github.com/netty/netty|
|apolloconfig/apollo|Apollo is a reliable configuration management system suitable for microservice configuration management scenarios.|https://github.com/apolloconfig/apollo|
|SeleniumHQ/selenium|A browser automation framework and ecosystem.|https://github.com/SeleniumHQ/selenium|
|alibaba/nacos|an easy-to-use dynamic service discovery, configuration and service management platform for building cloud native app…|https://github.com/alibaba/nacos|
|JakeWharton/butterknife|Bind Android views and callbacks to fields and methods.|https://github.com/JakeWharton/butterknife|
|alibaba/fastjson|FASTJSON 2.0.x has been released, faster and more secure, recommend you upgrade.|https://github.com/alibaba/fastjson|
|alibaba/spring-cloud-alibaba|Spring Cloud Alibaba provides a one-stop solution for application development for the distributed solutions of Alibab…|https://github.com/alibaba/spring-cloud-alibaba|
|apache/kafka|Mirror of Apache Kafka|https://github.com/apache/kafka|
|greenrobot/EventBus|Event bus for Android and Java that simplifies communication between Activities, Fragments, Threads, Services, etc. |https://github.com/greenrobot/EventBus|
|signalapp/Signal-Android|A private messenger for Android.|https://github.com/signalapp/Signal-Android|
|TeamNewPipe/NewPipe|A libre lightweight streaming front-end for Android|https://github.com/TeamNewPipe/NewPipe|
|google/gson|A Java serialization/deserialization library to convert Java Objects into JSON and back|https://github.com/google/gson|
|apache/skywalking|APM, Application Performance Monitoring System|https://github.com/apache/skywalking|

# Parse xml -> sql database
Using parserXML.py

For specific logic:
* Replacement of the value '∞' by 9 999 999 \
* Replacement of the value 'NaN' by -9 999 999 \
* Replacement of the valye 'N/A' by null

