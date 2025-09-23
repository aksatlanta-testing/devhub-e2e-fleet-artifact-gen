
{{- define "go-echocd7a5785-5f3e-46c1-a553-fdc8f0326d30.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocd7a5785-5f3e-46c1-a553-fdc8f0326d30.fullname" -}}
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


{{- define "go-echocd7a5785-5f3e-46c1-a553-fdc8f0326d30.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocd7a5785-5f3e-46c1-a553-fdc8f0326d30.labels" -}}
helm.sh/chart: {{ include "go-echocd7a5785-5f3e-46c1-a553-fdc8f0326d30.chart" . }}
{{ include "go-echocd7a5785-5f3e-46c1-a553-fdc8f0326d30.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocd7a5785-5f3e-46c1-a553-fdc8f0326d30.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocd7a5785-5f3e-46c1-a553-fdc8f0326d30.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}