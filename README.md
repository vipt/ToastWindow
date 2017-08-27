# ToastWindow

## Demo

![Demo](https://media.giphy.com/media/xT9Igjd8QlpK89T0BO/giphy.gif)

## Usage

```swift
class ViewController: UIViewController, Toastable {
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        showToast(message: "Hello World!", duration: 2.0)
    }
}

```
