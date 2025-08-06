
{{- define "go-echofe321466-938e-43d3-a958-09be2109ecae.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofe321466-938e-43d3-a958-09be2109ecae.fullname" -}}
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


{{- define "go-echofe321466-938e-43d3-a958-09be2109ecae.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofe321466-938e-43d3-a958-09be2109ecae.labels" -}}
helm.sh/chart: {{ include "go-echofe321466-938e-43d3-a958-09be2109ecae.chart" . }}
{{ include "go-echofe321466-938e-43d3-a958-09be2109ecae.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofe321466-938e-43d3-a958-09be2109ecae.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofe321466-938e-43d3-a958-09be2109ecae.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}