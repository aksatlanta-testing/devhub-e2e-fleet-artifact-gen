
{{- define "go-echoa1f02a32-c26b-4297-98d8-e855b48ead9e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa1f02a32-c26b-4297-98d8-e855b48ead9e.fullname" -}}
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


{{- define "go-echoa1f02a32-c26b-4297-98d8-e855b48ead9e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa1f02a32-c26b-4297-98d8-e855b48ead9e.labels" -}}
helm.sh/chart: {{ include "go-echoa1f02a32-c26b-4297-98d8-e855b48ead9e.chart" . }}
{{ include "go-echoa1f02a32-c26b-4297-98d8-e855b48ead9e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa1f02a32-c26b-4297-98d8-e855b48ead9e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa1f02a32-c26b-4297-98d8-e855b48ead9e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}