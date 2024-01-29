![Passing]( https://img.shields.io/badge/build-passing%20%E2%9C%93%20996%20tests%20(0%20failed)-brightgreen "passing") ![Nuget](https://img.shields.io/nuget/v/IronPdf)  ![Downloads]( https://img.shields.io/nuget/dt/IronPdf "Downloads")  ![Support]( https://img.shields.io/badge/support-active-blue "Support")

## IronPDF helps C# Software Engineers to create, edit and extract PDF content in .NET projects.

- C# HTML to PDF for *.NET 5, Core, Standard, and Framework* 
- Work with PDFs in C# using HTML, MVC, ASPX, and images 
- Generate, Edit, Read and Secure PDF Documents 

### Generate PDFs with Pixel Perfect Chrome HTML to PDF Rendering
The Iron PDF library takes the frustration out of generating PDF documents by not relying on proprietary APIs. “Html-To-Pdf” renders pixel-perfect PDFs from open standard document types: HTML, JS, CSS, JPG, PNG, GIF, and SVG. In short, it uses the skills that developers already possess. 

### Fully Supports:
Windows, MacOS, Linux, Azure, Docker and AWS 

### Licensing & Support available
For code examples, tutorials and documentation visit https://ironpdf.com/
Email: developers@ironsoftware.com 


## Get Started Code Example


```

using IronPdf;

  

var Renderer = new IronPdf.ChromePdfRenderer();

Renderer.RenderHtmlAsPdf("<h1>Html with CSS and Images</h1>").SaveAs("pixel-perfect.pdf");

  

/****** Advanced ******/

// Load external html assets: images, css and javascript.

// An optional BasePath 'C:\site\assets\' is set as the file location to load assets from

var PDF = Renderer.RenderHtmlAsPdf("<img src='icons/iron.png'>", @"C:\site\assets\");

PDF.SaveAs("html-with-assets.pdf");

```

  

## Documentation Links

- Code Samples : https://ironpdf.com/examples/

- MSDN Class Reference : https://ironpdf.com/object-reference/api/

- Tutorials : https://ironpdf.com/tutorials/

- Licensing : https://ironpdf.com/licensing/

- Support : developers@ironsoftware.com

  
  
  
  
  
  

## Compatibility

Welcome to the cutting edge of .NET PDF rendering and manipulation technology with IronPDF 2021 now featuring Chrome identical HTML rendering with full support for:

- C#, F#, and VB.NET

- .Net 5, Core 2x & 3x, Standard 2, and Framework 4x

- Console, Web, & Desktop Apps

- Windows, Linux (Debian, CentOS, Ubuntu), MacOs, Docker, and Azure

- Microsoft Visual Studio or Jetbrains ReSharper & Rider

  

## Generating PDFs

Generate PDFs in C# with HTML, MVC, ASPX, & images.

- HTML to PDF using HTML Files, Strings, URLs, ASPX, Razor and MVC Views

- Image to PDF and PDF to Image

- Supports Base 64 Encoding, Base URLs, and Custom File Paths

- Website & System Logins, Custom User Agents, Proxies, Cookies, HTTP Headers, Async & Multithreading

  

## Formatting PDFs

Supports HTML, JS and CSS Standards using modern Chrome Rendering

- HTML (5 and below), CSS (Screen & Print), Images (jpg, png, gif, tiff, svg, bmp), JavaScript (+ Render Delays), Fonts (Web & Icon)

- Use Responsive Layouts, Set Virtual Viewports and Zoom

- Apply Headers & Footers, Page Numbers, and Page Breaks

- Page Settings for Custom Paper Size, Orientation & Rotation, Margins (mm, inch, & zero), Color & Grayscale, Resolution & JPEG Quality

- International Language Support with UTF-8 HTML Encoding

  

## Manipulating PDFs

Edit, Read and Secure PDF Documents

- Merge & Split PDFs. Add / Duplicate / Delete Pages

- Add New HTML Content, Headers & Footers, Stamp & Watermark, Backgrounds & Foregrounds, Annotations, Outlines & Bookmarks

- Create, Edit, and Fill PDF Forms

- Apply PDF Metadata, Permissions & Passwords, Digital Signatures

- Print PDFs to Physical Printers

- Read Text and Images from PDFs

  
  

You can email us at developers@ironsoftware.com for support directly from our code team. We offer licensing and extensive support for commercial deployment projects.

  
  

Installing IronPDF 2021

=============================================================

  

## To Install:

```

PM> Install-Package IronPdf

```

  
  

### Upgrade Guide for Existing Users

  

IronPdf updates all usages of your existing HtmlToPdf and AspToPdf code to use our new Chrome Rendering Engine.

  

Remove any reference to **IronPdf.Threading** which is now legacy software. The IronPdf main package is threading and async compatible!

  

### Try out the new 2021 API

We haven’t broken the IronPDF API you are using, it will remain!

However, the old style is being superseded by a better one to give you more control. For examples you now have Print options and Http Login controls specific to your renderer

  

```

using IronPdf;

//...

ChromePdfRenderer Renderer = new ChromePdfRenderer();

Renderer.RenderingOptions.FitToPaper = true;

Renderer.RenderingOptions.CssMediaType = IronPdf.Rendering.PdfCssMediaType.Screen;

Renderer.RenderingOptions.PrintHtmlBackgrounds = true;

Renderer.RenderingOptions.CreatePdfFormsFromHtml = true;

var doc = Renderer.RenderHtmlAsPdf(“<h1>Hello world!</h1>“);

//var doc = Renderer.RenderUrlAsPdf(“https://www.google.com/”);

//var doc = Renderer.RenderHtmlFileAsPdf(“example.html”);

doc.SaveAs(“google_chrome.pdf”);

```

  

### Pixel perfect Chrome rendering!

This example will give you PDFs which are pixel perfect to the latest chrome desktop browser’s “print to pdf” functionality:

```

ChromePdfRenderer Renderer = new ChromePdfRenderer();

Renderer.RenderingOptions.CssMediaType = IronPdf.Rendering.PdfCssMediaType.Print;

Renderer.RenderingOptions.PrintHtmlBackgrounds = false;

Renderer.RenderingOptions.CreatePdfFormsFromHtml = false;

var doc = Renderer.RenderUrlAsPdf(“https://www.google.com/”);

```

### However...we would recommend using improved features such as:

Using screen stylesheets to print PDFs which are less fiddly to develop and more true to existing web assets.

* Responsive layout support

* Creating PDF Forms from your HTML form elements.

```

ChromePdfRenderer Renderer = new ChromePdfRenderer();

Renderer.RenderingOptions.CssMediaType = IronPdf.Rendering.PdfCssMediaType.Screen;

Renderer.RenderingOptions.PrintHtmlBackgrounds = true;

Renderer.RenderingOptions.CreatePdfFormsFromHtml = true;

Renderer.RenderingOptions.ViewportWidth = 1080 ; //px

var doc = Renderer.RenderUrlAsPdf(“https://www.google.com/”);

```

  

### Comparing Chrome and WebKit

You can use the IronPdf.Rendering.AdaptivePdfRenderer to switch between the ‘Chrome’ and ‘WebKit’ rendering at an instance level if you preferred the old rendering style for some of your application, or dont want to break unit tests.

  

```

using IronPdf;

//...

IronPdf.Rendering.AdaptivePdfRenderer Renderer = new IronPdf.Rendering.AdaptivePdfRenderer();

Renderer.RenderingOptions.RenderingEngine = IronPdf.Rendering.PdfRenderingEngine.Chrome; //switch between Chrome and WebKit here

var doc = Renderer.RenderHtmlAsPdf(“<h1>Hello world!</h1>“);

```

  

### Use every CPU core available!

- Multithreading and Async support for our Chrome rendering engine is in a different league to previous build.

- For enterprise grade multi-threading use our Chrome in your existing threads and it will work. For web applications this also takes zero setup.

- For batch processing for HtmlToPdf we suggest using the built in .NETParallel.ForEach

- We love async and have provided Async variants of methods such as ChromePdfRenderer.RenderHtmlAsPdf

  

## MSDN Style Class Reference

Explore the [IronPDF API](https://ironpdf.com/object-reference/api/IronPdf.html) in the left navigation of this page.

Popular Links include:

- [IronPdf Namespace](https://ironpdf.com/object-reference/api/IronPdf.html) Index of all IronPdf Classes

- [IronPdf.ChromePdfRenderer](https://ironpdf.com/object-reference/api/IronPdf.ChromePdfRenderer.html) Html to PDF generator

- [IronPdf.ChromePdfRenderOptions](https://ironpdf.com/object-reference/api/IronPdf.ChromePdfRenderOptions.html) Html to PDF generation settings

- [IronPdf.AspxToPdf](https://ironpdf.com/object-reference/api/IronPdf.AspxToPdf.html) ASPX to PDF generator

- [IronPdf.ImageToPdfConverter](https://ironpdf.com/object-reference/api/IronPdf.ImageToPdfConverter.html) Image to PDF generator

- [IronPdf.PdfDocument](https://ironpdf.com/object-reference/api/IronPdf.PdfDocument.html) A class to open, manipulate, extract data and save PDF files