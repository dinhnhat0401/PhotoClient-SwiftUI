# PhotoClient-SwiftUI

[![Swift Version][swift-image]][swift-url]
[![Build Status][travis-image]][travis-url]
[![License][license-image]][license-url]
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

# Photo Client with SwiftUI
<br />
<p align="center">
  <p align="center">
    Simple project to demonstrate how to use SwiftUI with MVVM to provide unit test friendly architeture.
  </p>
</p>

<p align="center">
  <img src= "https://user-images.githubusercontent.com/2002871/136699598-174aa157-4f06-4850-a3f6-d220af36732d.gif" width="200" >
</p>


## Features

- [x] MVVM architecture pattern constructed with M, VM, V splited to separate static library to avoid unwanted crossing references
- [x] Search images using Pixabay API
- [x] Auto load more when reach last image result
- [x] Image details

## TODOs

- [ ] Unit tests
- [ ] Interaction in image details

## Requirements

- iOS 14.0+
- Xcode 13.0

## Installation

Add Pixabay+Config.swift file to PhotoClient-SwiftUI/Models/Network with content:

```
import Foundation

extension PixabayAPI {
    internal struct Config {
        static let apiKey = "YOUR-API-KEY"
    }
}
```

## Contribute

We would love you for the contribution to **PhotoClient-SwiftUI**, check the ``LICENSE`` file for more info.

## Meta

Nate – [@DinhNha88577038](https://twitter.com/DinhNha88577038)

Distributed under the APACHE license. See ``LICENSE`` for more information.

[https://github.com/dinhnhat0401/PhotoClient-SwiftUI](https://github.com/dinhnhat0401/)

[swift-image]:https://img.shields.io/badge/swift-5.0-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-APACHE-blue.svg
[license-url]: LICENSE
[travis-image]: https://img.shields.io/travis/dbader/node-datadog-metrics/master.svg?style=flat-square
[travis-url]: https://travis-ci.org/dbader/node-datadog-metrics
[codebeat-image]: https://codebeat.co/badges/c19b47ea-2f9d-45df-8458-b2d952fe9dad
[codebeat-url]: https://codebeat.co/projects/github-com-vsouza-awesomeios-com
