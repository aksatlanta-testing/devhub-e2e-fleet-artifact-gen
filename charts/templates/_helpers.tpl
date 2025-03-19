
{{- define "go-echo92ad8e82-5587-4d8b-b78c-d8c165b9592d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo92ad8e82-5587-4d8b-b78c-d8c165b9592d.fullname" -}}
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


{{- define "go-echo92ad8e82-5587-4d8b-b78c-d8c165b9592d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo92ad8e82-5587-4d8b-b78c-d8c165b9592d.labels" -}}
helm.sh/chart: {{ include "go-echo92ad8e82-5587-4d8b-b78c-d8c165b9592d.chart" . }}
{{ include "go-echo92ad8e82-5587-4d8b-b78c-d8c165b9592d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo92ad8e82-5587-4d8b-b78c-d8c165b9592d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo92ad8e82-5587-4d8b-b78c-d8c165b9592d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}