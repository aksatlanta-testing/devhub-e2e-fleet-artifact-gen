
{{- define "go-echod9c5f0fc-b326-4d5b-96ec-cb662e8db601.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod9c5f0fc-b326-4d5b-96ec-cb662e8db601.fullname" -}}
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


{{- define "go-echod9c5f0fc-b326-4d5b-96ec-cb662e8db601.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod9c5f0fc-b326-4d5b-96ec-cb662e8db601.labels" -}}
helm.sh/chart: {{ include "go-echod9c5f0fc-b326-4d5b-96ec-cb662e8db601.chart" . }}
{{ include "go-echod9c5f0fc-b326-4d5b-96ec-cb662e8db601.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod9c5f0fc-b326-4d5b-96ec-cb662e8db601.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod9c5f0fc-b326-4d5b-96ec-cb662e8db601.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}