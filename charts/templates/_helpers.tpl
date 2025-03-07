
{{- define "go-echo16ce6d36-7a84-4c2c-91bd-9a31f799a5dd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo16ce6d36-7a84-4c2c-91bd-9a31f799a5dd.fullname" -}}
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


{{- define "go-echo16ce6d36-7a84-4c2c-91bd-9a31f799a5dd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo16ce6d36-7a84-4c2c-91bd-9a31f799a5dd.labels" -}}
helm.sh/chart: {{ include "go-echo16ce6d36-7a84-4c2c-91bd-9a31f799a5dd.chart" . }}
{{ include "go-echo16ce6d36-7a84-4c2c-91bd-9a31f799a5dd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo16ce6d36-7a84-4c2c-91bd-9a31f799a5dd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo16ce6d36-7a84-4c2c-91bd-9a31f799a5dd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}