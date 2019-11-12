# Coach marks
Add customizable coach marks into your iOS project. Available for both iPhone and iPad.

# Table of contents

  * [Overview](#overview)
  * [Requirements](#requirements)
  * [Asking Questions](#asking-questions)
      * [Asking Questions](#asking-questions)
  * [Installation](#installation)
      * [CocoaPods](#cocoapods)
  * [Usage](#usage)
      * [Getting Started](#getting-started)
      * [Delegate](#delegate)
  * [License](#license)

## Overview
![VVCoachMarks Demo](https://github.com/ValentineVV/VVCoachMarks/blob/master/demo.gif)

## Requirements
- Xcode 11 / Swift 5+
- iOS 10.0+

## Asking Questions

### Asking questions

If you need help with something in particular, ask a question in the [mail](https://imgur.com/a/vKVu587).

## Installation

### CocoaPods
Add VVCoachMarks to your Podfile:

```ruby
platform :ios, '10.0'
use_frameworks!

pod 'VVCoachMarks'
```

Then, run the following command:

```bash
$ pod install
```

## Usage

### Getting started
Open up the controller for which you wish to display coach marks and for example create `VVCoachMark`, then use `VVCoachMarkManager` shared instance and show coach mark passing it to `showCoachMark()` function.

```swift
class DefaultViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            
            let coachMarkManager = VVCoachMarkManager.shared
            coachMarkManager.delegate = self
            let coachMark = VVCoachMark(for: self.button, in: self.view, coachMarkPosition: .topCenter, message: "Coach mark message")
            coachMarkManager.showCoachMark(coachMark)
        }
}
```

### Delegate
`VVCoachMarkManagerDelegate` declares two optional methods.

The first one lets you provide custom body view for your coach mark or default view will be used.

```swift
func viewForCoachMarkBody() -> UIView? {
    return isCustomBody ? UIImageView(image: UIImage(named: "1.jpg")) : nil
}
```

The second one lets you provide custom arrow view for your coach mark or default view will be used.

```swift
let pointOfInterest = UIView()

func viewForCoachMarkArrow() -> UIView? {
    return !isCustomBody ? UIImageView(image: #imageLiteral(resourceName: "arrow")) : nil
}
```

## License

VVCoachMarks is released under the MIT license. See LICENSE for details.
