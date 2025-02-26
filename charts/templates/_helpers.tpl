
{{- define "go-echod7c60883-7078-4ca0-9007-db6a845000af.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod7c60883-7078-4ca0-9007-db6a845000af.fullname" -}}
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


{{- define "go-echod7c60883-7078-4ca0-9007-db6a845000af.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod7c60883-7078-4ca0-9007-db6a845000af.labels" -}}
helm.sh/chart: {{ include "go-echod7c60883-7078-4ca0-9007-db6a845000af.chart" . }}
{{ include "go-echod7c60883-7078-4ca0-9007-db6a845000af.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod7c60883-7078-4ca0-9007-db6a845000af.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod7c60883-7078-4ca0-9007-db6a845000af.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}