
{{- define "go-echof006135e-91e5-43da-8118-baf01e3bf925.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof006135e-91e5-43da-8118-baf01e3bf925.fullname" -}}
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


{{- define "go-echof006135e-91e5-43da-8118-baf01e3bf925.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof006135e-91e5-43da-8118-baf01e3bf925.labels" -}}
helm.sh/chart: {{ include "go-echof006135e-91e5-43da-8118-baf01e3bf925.chart" . }}
{{ include "go-echof006135e-91e5-43da-8118-baf01e3bf925.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof006135e-91e5-43da-8118-baf01e3bf925.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof006135e-91e5-43da-8118-baf01e3bf925.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}