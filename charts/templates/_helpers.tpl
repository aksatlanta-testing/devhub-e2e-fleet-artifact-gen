
{{- define "go-echof2bc6186-882b-4edc-899b-7976ccf786ec.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof2bc6186-882b-4edc-899b-7976ccf786ec.fullname" -}}
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


{{- define "go-echof2bc6186-882b-4edc-899b-7976ccf786ec.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof2bc6186-882b-4edc-899b-7976ccf786ec.labels" -}}
helm.sh/chart: {{ include "go-echof2bc6186-882b-4edc-899b-7976ccf786ec.chart" . }}
{{ include "go-echof2bc6186-882b-4edc-899b-7976ccf786ec.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof2bc6186-882b-4edc-899b-7976ccf786ec.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof2bc6186-882b-4edc-899b-7976ccf786ec.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}