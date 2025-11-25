
{{- define "go-echodb1f8415-373b-43ab-bc0e-039822a1c389.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodb1f8415-373b-43ab-bc0e-039822a1c389.fullname" -}}
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


{{- define "go-echodb1f8415-373b-43ab-bc0e-039822a1c389.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodb1f8415-373b-43ab-bc0e-039822a1c389.labels" -}}
helm.sh/chart: {{ include "go-echodb1f8415-373b-43ab-bc0e-039822a1c389.chart" . }}
{{ include "go-echodb1f8415-373b-43ab-bc0e-039822a1c389.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodb1f8415-373b-43ab-bc0e-039822a1c389.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodb1f8415-373b-43ab-bc0e-039822a1c389.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}