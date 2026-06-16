allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

// subprojects {
//    project.evaluationDependsOn(":app")
// }

subprojects {
    afterEvaluate {
        if (project.hasProperty("android")) {
            val android = project.property("android") as com.android.build.gradle.BaseExtension
            android.compileSdkVersion(35)
        }
    }
}

subprojects {
    plugins.withId("com.android.library") {
        extensions.configure<com.android.build.gradle.LibraryExtension>("android") {
            if (project.name == "isar_flutter_libs") {
                namespace = "dev.isar.isar_flutter_libs"
            }
        }
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
