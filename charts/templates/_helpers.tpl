
{{- define "go-echo6a5a08d0-8f42-406c-9bf9-b944a90ff11e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6a5a08d0-8f42-406c-9bf9-b944a90ff11e.fullname" -}}
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


{{- define "go-echo6a5a08d0-8f42-406c-9bf9-b944a90ff11e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6a5a08d0-8f42-406c-9bf9-b944a90ff11e.labels" -}}
helm.sh/chart: {{ include "go-echo6a5a08d0-8f42-406c-9bf9-b944a90ff11e.chart" . }}
{{ include "go-echo6a5a08d0-8f42-406c-9bf9-b944a90ff11e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6a5a08d0-8f42-406c-9bf9-b944a90ff11e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6a5a08d0-8f42-406c-9bf9-b944a90ff11e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}