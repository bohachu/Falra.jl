<div align="center">
  <a href="https://genieframework.com/">
    <img
      src="docs/content/img/genie-lightblue.svg"
      alt="Genie Logo"
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
    <b> 🧞 Apply distributed computation rapidly without hosting any instances.
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

<!-- #### **Need Help?** Reach out on our social media channels.

[![Chat on Discord](https://img.shields.io/badge/chat-Discord-7289DA?logo=discord)](https://discord.com/invite/9zyZbD6J7H) [![Chat on Gitter](https://img.shields.io/badge/gitter-chat-red)](https://gitter.im/essenciary/Genie.jl) [![Discuss on GitHub](https://img.shields.io/badge/discussions-GitHub-333333?logo=github)](https://github.com/GenieFramework/Genie.jl/discussions)

<div style="border: 2px solid crimson; background-color: linen;">
  <h4>Genie v4 and Julia v1.8 compatibility issue: <code>modules_warned_for not defined</code></h4>

  <p>
Due to an issue caused by the removal of some APIs in Julia 1.8, **Genie v4 apps can not run on Julia 1.8**. This results in a `LoadError: UndefVarError: modules_warned_for not defined` exception when loading a Genie v4 app on Julia 1.8 and above.
  </p>

  <strong>Please follow the Genie v4 to Genie v5 migration guide to update your app and make it compatible with Julia 1.8 and above.</strong>
</div>

<hr>

<details open>
  <summary><b>Table of contents</b></summary>

---

- [**Made With Genie**](#made-with-genie)
- [**Community Curated Resources**](#community-curated-resources)
- [**Community Mentions**](#community-mentions)
- [**Contributing**](#contributing)
- [**Special Credits**](#special-credits)
- [**License**](#license)

---

</details> -->

### **Features**

💪 **Just like on your console, but 100 times faster!**
- Falra framework helps you execute your programs on our distributed computing platform easily.

💪 **No extra settings!**
- Falra framework transfer through https without setting any firewall settings.


🔌 **Install:** Genie provides a powerful workflow for client-server communication over websockets

to install julia: https://julialang.org/downloads/

git clone https://github.com/bohachu/Falra.jl

julia src/server.jl

📃 **Provide examples of use:** Support for `Julia`, `Python`, `JavaScript`.

We can support three different programming languages, including Julia 1.7.2, Python 3.10.4, and Javascript (Deno 1.22.0).

We use the CURL command to call Falra Framework distributed computing, the following are the examples in three different languages. 

Example:

```curl
== julia ==

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

```curl
== python ==

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

```curl
== deno ==

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

<!-- ⏰ **Tasks:** Tasks allow you to perform various operations and hook them with crons jobs for automation

```julia
module S3DBTask
# ... hidden code
  """
  Downloads S3 files to local disk.
  Populate the database from CSV file
  """
  function runtask()
    mktempdir() do directory
      @info "Path of directory" directory
      # download record file
      download(RECORD_URL)
      # unzip file
      unzip(directory)
      # dump to database
      dbdump(directory)
    end
  end
# ... more hidden code
end
```

```shell
$ bin/runtask S3DBTask
```

📦 **Plugin Ecosystem:** Explore plugins built by the community such as [GenieAuthentication](https://github.com/GenieFramework/GenieAuthentication.jl), [GenieAutoreload](https://github.com/GenieFramework/GenieAutoreload.jl), [GenieAuthorisation](https://github.com/GenieFramework/GenieAuthorisation.jl), and more

🗃️ **ORM Support:** Explore [SearchLight](https://github.com/GenieFramework/SearchLight.jl) a complete ORM solution for Genie, supporting Postgres, MySQL, SQLite and other adapters

```julia
function search(user_names, regions, startdate, enddate)
# ... hidden code
  where_filters = SQLWhereEntity[
      SQLWhereExpression("lower(user_name) IN ( $(repeat("?,", length(user_names))[1:end-1] ) )", user_names),
      SQLWhereExpression("date >= ? AND date <= ?", startdate, enddate)
  ]
  SearchLight.find(UserRecord, where_filters, order=["record.date"])
# ... more hidden code
end
```

- `Database Migrations`
```julia
module CreateTableRecord
import SearchLight.Migrations: create_table, column, primary_key, add_index, drop_table
function up()
  create_table(:record) do
    [
      primary_key()
      column(:user_uuid, :string, limit = 100)
      column(:user_name, :string, limit = 100)
      column(:status, :integer, limit = 4)
      column(:region, :string, limit = 20)
      column(:date_of_birth, :string, limit = 100)
    ]
  end
  add_index(:record, :user_uuid)
  add_index(:record, :user_name)
  add_index(:record, :region)
  add_index(:record, :date_of_birth)
end
function down()
  drop_table(:record)
end
end
```

* `Model Validations`

📝 More Genie features like:
* `Files Uploads`

```julia
route("/", method = POST) do
  if infilespayload(:yourfile)
    write(filespayload(:yourfile))
    stat(filename(filespayload(:yourfile)))
  else
    "No file uploaded"
  end
end
```

* `Logging` | `Caching` | `Cookies and Sessions` | `Docker, Heroku, JuliaHub, etc Integrations` | `Genie Deploy`
* To explore more features check [Genie Documentation](https://www.genieframework.com/docs/genie/tutorials/Overview.html) 🏃‍♂️🏃‍♀️

## **Made With Genie**

- Packages/Libraries:

  * Stipple: [Stipple is a reactive UI library for building interactive data applications in pure Julia](https://github.com/GenieFramework/Stipple.jl)

  * StippleUI: [StippleUI is a library of reactive UI elements for Stipple.jl](https://github.com/GenieFramework/StippleUI.jl)

  * StipplePlotly: [StipplePlotly is a plotting library for Stipple.jl](https://github.com/GenieFramework/StipplePlotly.jl)

  * StippleCharts: [StippleCharts is yet another plotting/charting solution for Stipple.jl](https://github.com/GenieFramework/StippleCharts.jl)

- Demo Apps:
  * Julia [package download app](https://github.com/GenieFramework/PkgVizBoard) ([data](https://discourse.julialang.org/t/announcing-package-download-stats/69073) provided by Julia Lang)
  * [German Credit visualization](0https://github.com/GenieFramework/Stipple-Demo-GermanCredits) dashboard
  * [Iris flowers dataset k-means clustering](https://github.com/GenieFramework/Stipple-Demo-IrisClustering) dashboard

## **Community Curated Resources**

* [![Awesome Genie](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg) **Awesome Genie**](https://github.com/AbhimanyuAryan/genie-awesome): A curated list of awesome things related to Julia's Web framework Genie.

## **Community Mentions**

* [6 Julia Frameworks to Create Desktop GUI’s 🖥 and Web Apps](https://logankilpatrick.medium.com/6-julia-frameworks-to-create-desktop-guis-and-web-apps-9ae1a941f115) by Logan Kilpatrick

* [12 Best Julia web frameworks](https://www.dunebook.com/julia-web-framework/) by Olanrewaju Olakunle

* [What are the best web frameworks for Julia programming language?](https://qr.ae/pG6Zdn) by Morgane Alinaï

## **Contributing**

Please contribute using [GitHub Flow](https://guides.github.com/introduction/flow). Create a branch, add commits, and [open a pull request](https://github.com/genieframework/genie.jl/compare).

Please read [`CONTRIBUTING`](CONTRIBUTING.md) for details on our [`CODE OF CONDUCT`](CODE_OF_CONDUCT.md), and the process for submitting pull requests to us.

## **Special Credits**

* The awesome Genie logo was designed by Alvaro Casanova

* Hoppscoth for readme structure template

* Genie uses a multitude of packages that have been kindly contributed by the Julia community -->

## **Contact information**
mail: service@cameo.tw

## **A link to your live site**
see the [`Falra Distributed Framework`](https://falra-web.vercel.app/)
