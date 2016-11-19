
var iDiv; var innerDiv2; var isCreated;
var sec = 7;

function showMessage(code, msg, msgType) {
    if (isCreated) {
        hideMessage();
    }
    //if (!isCreated) {
    iDiv = document.createElement('div');
    iDiv.id = 'divErrorMsg';
    iDiv.className = 'errorBox';

    if (msgType == 0)
        iDiv.innerHTML =
        '<div style="margin-left:20px;background-image:url(\'/images/warning.png\');background-repeat:no-repeat;' +
        'float:left;width:70px;height:70px;background-size:contain;">&nbsp;<br /><br /><br /></div>' +
        '<div style="margin-left: 30px;top:-10px;background-color:transparent;float:left;width:50%;"><b> ERROR - ' +
         code + ' : </b><br />' + msg + '</div>';
    else
        iDiv.innerHTML = 
        '<div style="margin-left:20px;background-image:url(\'/images/information.png\');' +
        'background-repeat:no-repeat;float:left;width:70px;height:70px;background-size:contain;">&nbsp;<br /><br /><br /></div>' +
        '<div style="margin-left: 30px;top:-10px;background-color:transparent;float:left;width:50%;"><b> INFO - ' +
         code + ' : </b><br />' + msg + '</div>';
    
    document.getElementsByTagName('body')[0].appendChild(iDiv);
    if (msgType == 0)
        iDiv.setAttribute("style", "width:" + (screen.width - 10) + "px;background-color: red; border-top: 5px solid #c00;");
    else
        iDiv.setAttribute("style", "width:" + (screen.width - 10) + "px;background-color: green; border-top: 5px solid Blue;");

    iDiv.style.display = 'block';

    innerDiv2 = document.createElement('div');
    innerDiv2.id = 'divErrorClose';
    innerDiv2.className = 'errorBoxRight';
    innerDiv2.innerHTML = 'X';
    innerDiv2.setAttribute("style", "height:30px");
    innerDiv2.style.visibility = 'visible';
    innerDiv2.addEventListener("click", hideMessage);
    iDiv.appendChild(innerDiv2);
    isCreated = true;

    //hideError();   
}

function hideError() {
    setTimeout(function () {
        hideMessage();
    }, sec * 1000);
}

function hideMessage() {
    try {
        var div = document.getElementById("divErrorMsg");
        div.parentNode.removeChild(div);
    }
    catch (er) {
        //try..catch for unwnated break occuring.
    }
    isCreated = false;
}

function loadEditor(textBox) {
    var ctl = '#' + (document.getElementById(textBox).id)
    $(ctl).htmlbox({
        toolbars: [
             ["undo", "redo", "separator_dots", "bold", "italic", "underline", "strike", "separator", "sub", "sup",
              "separator_dots", "separator_dots", "left", "center", "right", "justify", "separator_dots",
              "ol", "ul", "indent", "outdent", "separator_dots", "link", "unlink"]
        ],
        css: "body{font-family:verdana;font-size:12px;}",
        icons: "default",
        skin: "default"
    });
}