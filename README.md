<div align="center">
  <a href="https://falra-web.vercel.app/">
    <img
      src="https://imgur.com/a/WhxpSuA"
      alt="FDF Logo"
      height="64"
    />
  </a>
  <br />
  <p>
    <h3>
      <b>
        Falra Distributed Framework
      </b>
    </h3>
  </p>
  <p>
    <b> 🦅 Apply distributed computation rapidly without hosting any instances.
    </b>
  </p>

<!--   <p>

[![Docs](https://img.shields.io/badge/genie-docs-greenyellow)](https://www.genieframework.com/docs/) [![current status](https://img.shields.io/badge/julia%20support-v1.6%20and%20up-dark%20green)](https://github.com/GenieFramework/Genie.jl/blob/173d8e3deb47f20b3f8b4e5b12da6bf4c59f3370/Project.toml#L53) [![Website](https://img.shields.io/website?url=https%3A%2F%2Fgenieframework.com&logo=genie)](https://www.genieframework.com/) [![Tests](https://img.shields.io/badge/build-passing-green)](https://github.com/GenieFramework/Genie.jl/actions) [![Genie Downloads](https://shields.io/endpoint?url=https://pkgs.genieframework.com/api/v1/badge/Genie)](https://pkgs.genieframework.com?packages=Genie) [![Tweet](https://img.shields.io/twitter/url?url=https%3A%2F%2Fgithub.com%2FGenieFramework%2FGenie.jl)](https://twitter.com/GenieMVC)

  </p> -->
<!--   <p>
    <sub>
      Built with ❤︎ by
      <a href="https://github.com/GenieFramework/Genie.jl/graphs/contributors">
        contributors
      </a>
    </sub>
  </p>
  <br /> -->
<!--   <p>
    <a href="https://www.genieframework.com/">
      <img
        src="docs/content/img/genie.gif"
        alt="Screenshot"
        width="100%"
      />
    </a>
  </p> -->
</div>

<!-- <p style="font-family:verdana;font-size:80%;margin-bottom:4%" align="center">
<u>Julia data dashboards powered by Genie</u>
</p> -->

<p align="center">
  By using curl command, you can easily deploy your code to Falra.jl and start to compute with multiple instances. Falra.jl can be called anywhere from edge devices to the internal computing center via HTTPS, which adopts firewall policy easily. Moreover, the code could be similar either stand-alone or remote call for distributed computation, it means you can save lots of time on maintaining different versions.
</p>

### **Features**
***
💪 **Just like on your console, but 100 times faster!**
- Falra framework helps you execute your programs on our distributed computing platform easily.

💪 **No extra settings!**
- Falra framework transfer through https without setting any firewall settings.


### **Install**
***
to install julia: https://julialang.org/downloads/

to install Falra Distributed Framework

```
git clone https://github.com/bohachu/Falra.jl
julia src/server.jl
```
### **Example**
***
### **Provide examples of use:** Support for `Julia`, `Python`, `JavaScript`.

We can support three different programming languages, including Julia 1.7.2, Python 3.10.4, and Javascript (Deno 1.22.0).

We use the CURL command to call Falra Framework distributed computing, the following are the examples in three different languages. 


`Julia`
```curl
time curl -d '
{
  "token":"token123",
  "path":"github/bohachu/add",
  "lst_command": ["julia"],
  "script_filename":"main.jl",
  "lst_parameters":["3","4.2"]
}
' -H "Content-Type: application/json" -X POST https://juliaserver.bowenchiu.repl.co/falra/dist/ 
```

`Python`
```curl
time curl -d '
{
  "token":"token123",
  "path":"github/bohachu/add",
  "lst_command": ["python3"],
  "script_filename":"main.py",
  "lst_parameters":["1.2","3.4"]
}
' -H "Content-Type: application/json" -X POST https://juliaserver.bowenchiu.repl.co/falra/dist/ 
```

`JavaScript`
```curl
time curl -d '
{
  "token":"token123",
  "path":"github/bohachu/add",
  "lst_command": ["deno","run"],
  "script_filename":"main.js",
  "lst_parameters":["3.1","4.2"]
}
' -H "Content-Type: application/json" -X POST https://juliaserver.bowenchiu.repl.co/falra/dist/
```

### **Contact information**
***
e-mail: service@cameo.tw

see the [`Falra Distributed Framework`](https://falra-web.vercel.app/)
