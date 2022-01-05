# SwiftPlus
SwiftPlus is made to have a package which contains everyday use extensions, functions and helper classes.

# Documentation
You can find the documentation [here](https://knoggl.github.io/SwiftPlus/).
Build the documentation with [jazzy](https://github.com/realm/jazzy)

# Swift Package Manager
Get this package with the Swift Package Manager
```swift
.package(url: "https://github.com/knoggl/SwiftPlus.git", .upToNextMinor(from: "1.0.1")),
```

# Tested Platforms
| Windows | iOS | macOS | Linux |
| :-: | :-: | :-: | :-: |
| ✅ | ✅ | ✅ | ✅ |


# Examples

### SPHttp
The ``SPHttp Class`` let's you easily connect to a server via Http. It also allows you to directly convert a json result into an object or object array.

``SPHttp.post``
```swift
SPHttp.post("YOUR_URL_STRING", parameters: [
    "foo": bar
]) { result, success in
    if success {
        print(result)
    }
}
```

``SPHttp.postObject``
```swift
SPHttp.postObject("YOUR_URL_STRING", parameters: [
    "foo": bar
], type: MyModel.self){ object, result, success in
    if success {
        if let object = object {
            // Do something with your object
        }
    }
}
```

``SPHttp.postObjectArray``
```swift
SPHttp.postObjectArray("YOUR_URL_STRING", parameters: [
    "foo": bar
], type: MyModel.self){ array, result, success in
    if success {
        if let array = array {
            // Do something with your array
        }
    }
}
```
