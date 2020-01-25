
# Choco Test


[![Swift 5.1](https://img.shields.io/badge/Swift-5.1-blue.svg?style=flat)](https://swift.org)
[![Xcode 11.3](https://img.shields.io/badge/Xcode-11.3.1-blue.svg?style=flat)](https://developer.apple.com/xcode/)
[![Cocoapods](https://img.shields.io/badge/cocoapods-compatible-brightgreen.svg?style=flat)](https://cocoapods.org)


It was developed an ordering app. It fetches a list from a server and place the order in a local storage using Realm. The orders have an unique id and are sorted by their creation date (from the most recent to the oldest). And when you click in an order, you can see the list of products you had chosen.

## Features



* MVVM
* Network Layer
* Repository
* Interface Builder
* UnitTets
* IQKeyboardManager
* Realm

### Prerequisites

* [Xcode](https://developer.apple.com/xcode/) 11.3
* [Cocoapods](https://cocoapods.org) 1.8.4


### Installing

Assuming you already have Xcode and Cocoapod installed, open your terminal, chose a diretory and clone the following repository:

```
https://github.com/mariaaeugenia/ChocoTest.git
```

Go to the directory where the file was cloned and type:

```
$ cd ChocoTest
$ pod install
```

Once the pods are installed, open the ChocoTest.xcworkspace

## Testing

An user and password are needed to login:
```
User: ​user@choco.com 
Password:​ chocorian
```

## Built With


* [IQKeyboardManager](https://github.com/hackiftekhar/IQKeyboardManager) - For keyboard management
* [Realm](https://realm.io/docs/swift/latest/) - For local storage
