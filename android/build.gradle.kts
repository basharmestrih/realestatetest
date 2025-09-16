import org.gradle.api.tasks.Delete
import org.gradle.api.file.Directory

allprojects {
    repositories {
        google()
        mavenCentral()
    }

    configurations.all {
        resolutionStrategy {
        force("androidx.media3:media3-extractor:1.3.1")
        force("androidx.media3:media3-container:1.3.1")
        force("androidx.media3:media3-datasource:1.3.1")
        force("androidx.media3:media3-decoder:1.3.1")
        force("androidx.media3:media3-database:1.3.1")
        force("androidx.media3:media3-common:1.3.1")
        force("androidx.media3:media3-exoplayer-hls:1.3.1")
        force("androidx.media3:media3-exoplayer-dash:1.3.1")
        force("androidx.media3:media3-exoplayer-rtsp:1.3.1")
        force("androidx.media3:media3-exoplayer-smoothstreaming:1.3.1")
        force("androidx.media3:media3-exoplayer:1.3.1")
        force("androidx.exifinterface:exifinterface:1.3.3")
        }
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.set(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.set(newSubprojectBuildDir)
}

subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
