# HackGov UGM - Mobile - Demo App

Table of Contents

<li>
    <ol><a href="">App Screenshot</a></ol>
    <ol><a href="">Widgets</a></ol>
    <ol><a href="">What's Next?</a></ol>
</li>

# App Screenshot

<img src="https://user-images.githubusercontent.com/48744669/120895243-4904e500-c646-11eb-9314-0ef03e832c82.png" width="300" />


# Widgets

## Text

A widget for displaying text. By default, you should provide the text that want to be displayed.

    Text("Hello World!")
    
## TextField

A widget for displaying a text box, used to hold user's input. 
There are some attributes that you should know:

<li>
    <ul>
        <b>decoration</b>
        <br />
        used to decorate the text field itself, e.g. giving a hint text, adding border, and so on.
    </ul>
    <ul>
        <b>controller</b>
        <br />
        controller is an object that hold the value of the text field. So, when you want to get what user has input in your text field, use the controller to retrieve the value.
    </ul>
    <ul>
        <b>obsecureText</b>
        <br />
        used to hide the text. usually used in password text field or any text fields that contain the sensitive content.
    </ul>

    TextField(
        controller: controller, // create the controller object first
        obscureText: true,
        decoration: InputDecoration(
          hintText: "Password",
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue)
          )
        )
    )
    
## ElevatedButton / TextButton / OutlinedButton

used to display a button. There are some attributes that you should know:

<li>
    <ul>
        <b>onPressed</b>
        <br />
        A callback function that is called when the user taps the button. Inside the callback, you can do some operations like validating input, redirecting user to another page, and so on.
    </ul>
    <ul>
        <b>child</b>
        <br />
        attribute to provide a widget that will displayed inside the text. Usually we provide a <b>Text</b> widget to display a text inside the button.
    </ul>
</li>

### ElevatedButton
<img src="https://user-images.githubusercontent.com/48744669/120894876-ce879580-c644-11eb-97f5-4f0019ce9ed6.png" />

### TextButton
<img src="https://user-images.githubusercontent.com/48744669/120894885-d7786700-c644-11eb-96fe-7ba873afc09c.png" />

### OutlinedButton
<img src="https://user-images.githubusercontent.com/48744669/120894895-e19a6580-c644-11eb-9a2a-a3ff0738eb9c.png" />

    ElevatedButton(onPressed: () {
        // Do something here when the button is clicked
      }, 
      child: Text("Login")
    );
    
## Image

used to render an image. The image source can be from url, assets, file, or memory. All you need to do is provide the url/path/file/bytes of the image.

    Image.network("provide_your_image_url_here");

## ContainerWidget

A multifunction-widget that is used to render literally a container (or you can called a box). With the container, you can add a background color, margin, padding, border, and so on. A really handy widget!

    Container(
        child: // provide your child widget here. The child widget will be rendered inside the container,
        margin: EdgeInsets.all(16.0), // give a margin for all sides
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 24.0, bottom: 24.0), // give a padding for specific side
        decoration: BoxDecoration(
            color: Colors.red // fill the container with red color
        )
    )


## Column

A widget that can hold one or more widget, and display the widgets vertically.

    Column(
        mainAxisAlignment: MainAxisAlignment.center, // Because the column display the widgets vertically, so the main axis is Y-axis. Centered the main axis means that we make all the widgets become centered in Y-axis
        children: [ // column hold the array of widgets, that will displaying the widgets in vertical way.
            FlutterImage(),
            UsernameTextField(),
            PasswordTextField(),
            LoginButton()
        ]
    )
    
The result of the code snippet above :

<img src="https://user-images.githubusercontent.com/48744669/120895502-625a6100-c647-11eb-9317-3627b1577fac.png" width="200" />


# What's Next?
