using Printf

function generate_github_action_yml(args::Vector{String}, repository::String, version::String, packages::Vector{String}, path::String, script::String, arg_name::String, max_parallel::Int)
    args_str = join(["\"$arg\"" for arg in args], "\n          - ")
    packages_str = join(packages, "\", \"")

    yml=@sprintf """
name: main.yml
on: workflow_dispatch
jobs:
  setup_environment_1:
    runs-on: ubuntu-latest
    strategy:
      max-parallel: %d
      matrix:
        %s:
          - %s
    steps:
      - name: Checkout repository and setup julia environment
        uses: actions/checkout@v2
        with:
          repository: %s
          ref: main
      - name: Set up Julia
        uses: julia-actions/setup-julia@v1
        with:
          version: '%s'
      - name: Run script
        run: 'julia -e ''using Pkg; Pkg.add([\"%s\"])'' && cd %s && julia %s --%s \"\${{ matrix.%s }}\"'
      - name: Upload individual result files as artifact
        uses: actions/upload-artifact@v3
        with:
          name: id_\${{github.run_id}}
          path: %s/data/\${{ matrix.%s }}_result.csv
          retention-days: 7

  merge_and_upload:
    needs: setup_environment_1
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v2
      - name: Download all artifacts
        uses: actions/download-artifact@v3
      - name: Merge CSV files
        run: 'for file in \$(ls -1 ./id_\${{github.run_id}}/*result.csv); do if [ "\$file" = "\$(ls -1 ./id_\${{github.run_id}}/*result.csv | head -n1)" ]; then cat \$file; else tail -n+2 \$file; fi; done > ./all_result.csv'
      - name: Upload merged file as artifact
        uses: actions/upload-artifact@v3
        with:
          name: all_result
          path: ./all_result.csv
          retention-days: 7
    """ max_parallel arg_name args_str repository version packages_str path script arg_name arg_name path arg_name
    mkpath("./data")
    open("./data/main.yml", "w") do f
      write(f, yml)
    end
    println(".yml file path: "*"./data/main.yml")
    println(".yml content:\n"*yml)
  end