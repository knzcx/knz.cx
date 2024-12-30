{{ range .Pages -}}
* [{{ .Title }}]({{ .Params.href }}){{ if .Params.source }} ([source]({{ .Params.source }})){{ end }} - {{ .Content }}
{{ end }}
