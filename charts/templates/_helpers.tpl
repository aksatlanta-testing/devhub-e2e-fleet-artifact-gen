
{{- define "go-echofcd37c28-7a71-4d03-9eed-43a7cf02343c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofcd37c28-7a71-4d03-9eed-43a7cf02343c.fullname" -}}
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


{{- define "go-echofcd37c28-7a71-4d03-9eed-43a7cf02343c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofcd37c28-7a71-4d03-9eed-43a7cf02343c.labels" -}}
helm.sh/chart: {{ include "go-echofcd37c28-7a71-4d03-9eed-43a7cf02343c.chart" . }}
{{ include "go-echofcd37c28-7a71-4d03-9eed-43a7cf02343c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofcd37c28-7a71-4d03-9eed-43a7cf02343c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofcd37c28-7a71-4d03-9eed-43a7cf02343c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}