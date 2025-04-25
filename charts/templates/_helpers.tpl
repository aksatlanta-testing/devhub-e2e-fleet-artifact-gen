
{{- define "go-echoff2518d3-5ac8-4df0-bbca-5a5030cbc495.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoff2518d3-5ac8-4df0-bbca-5a5030cbc495.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echoff2518d3-5ac8-4df0-bbca-5a5030cbc495.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoff2518d3-5ac8-4df0-bbca-5a5030cbc495.labels" -}}
helm.sh/chart: {{ include "go-echoff2518d3-5ac8-4df0-bbca-5a5030cbc495.chart" . }}
{{ include "go-echoff2518d3-5ac8-4df0-bbca-5a5030cbc495.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoff2518d3-5ac8-4df0-bbca-5a5030cbc495.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoff2518d3-5ac8-4df0-bbca-5a5030cbc495.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}