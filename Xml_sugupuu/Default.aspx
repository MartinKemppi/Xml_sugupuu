<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Xml_sugupuu._Default" %>

<!DOCTYPE html>
<html>
    <head>
        <title>xml ja xslt andmete kuvamine</title>
        <link rel="stylesheet" type="text/css" href="style.css" />
    </head>
    <body>
        <h1>xml ja xslt andmete kuvamine</h1>
        <br />
        <div>
            <asp:Xml runat="server" DocumentSource="~/Autod.xml"
                TransformSource="~/Autod_lisa.xslt"/>
        </div>
    </body>
</html>