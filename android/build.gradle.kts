plugins {
    id 'com.android.application'
    id 'com.google.gms.google-services'
    id 'kotlin-android' // Only include if using Kotlin
}

android {
    namespace 'com.example.homeease' // Update with your package name
    compileSdkVersion 34 // Update to your target SDK

    defaultConfig {
        applicationId "com.example.homeease"
        minSdkVersion 21
        targetSdkVersion 34
        versionCode 1
        versionName "1.0.0"
        multiDexEnabled true
    }

    buildTypes {
        release {
            minifyEnabled false
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
        }
    }

    compileOptions {
        sourceCompatibility JavaVersion.VERSION_1_8
        targetCompatibility JavaVersion.VERSION_1_8
    }

    kotlinOptions {
        jvmTarget = '1.8' // Only include if using Kotlin
    }

    buildFeatures {
        viewBinding true // Optional: Enable if using view binding
    }
}

dependencies {
    // Core Flutter dependencies
    implementation project(':flutter')

    // Firebase BoM (Bill of Materials)
    implementation platform('com.google.firebase:firebase-bom:32.7.4')

    // Firebase dependencies
    implementation 'com.google.firebase:firebase-analytics'
    implementation 'com.google.firebase:firebase-auth'
    implementation 'com.google.firebase:firebase-firestore' // Optional
    implementation 'com.google.android.gms:play-services-auth:20.7.0' // For Google Sign-In

    // MultiDex support
    implementation 'androidx.multidex:multidex:2.0.1'

    // Add your existing dependencies here
    implementation 'androidx.appcompat:appcompat:1.6.1'
    implementation 'com.google.android.material:material:1.10.0'
    implementation 'androidx.constraintlayout:constraintlayout:2.1.4'
    implementation platform('com.google.firebase:firebase-bom:33.12.0')
}

// Apply the Google Services plugin (alternative method if not using plugins block)
// apply plugin: 'com.google.gms.google-services'