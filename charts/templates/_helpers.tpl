
{{- define "go-echoae9ba407-c447-4d97-9e3b-5edc7c8d3a12.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoae9ba407-c447-4d97-9e3b-5edc7c8d3a12.fullname" -}}
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


{{- define "go-echoae9ba407-c447-4d97-9e3b-5edc7c8d3a12.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoae9ba407-c447-4d97-9e3b-5edc7c8d3a12.labels" -}}
helm.sh/chart: {{ include "go-echoae9ba407-c447-4d97-9e3b-5edc7c8d3a12.chart" . }}
{{ include "go-echoae9ba407-c447-4d97-9e3b-5edc7c8d3a12.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoae9ba407-c447-4d97-9e3b-5edc7c8d3a12.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoae9ba407-c447-4d97-9e3b-5edc7c8d3a12.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}