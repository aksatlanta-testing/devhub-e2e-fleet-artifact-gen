
{{- define "go-echo88460d22-369d-4b5d-84ee-54c4636a0edf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo88460d22-369d-4b5d-84ee-54c4636a0edf.fullname" -}}
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


{{- define "go-echo88460d22-369d-4b5d-84ee-54c4636a0edf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo88460d22-369d-4b5d-84ee-54c4636a0edf.labels" -}}
helm.sh/chart: {{ include "go-echo88460d22-369d-4b5d-84ee-54c4636a0edf.chart" . }}
{{ include "go-echo88460d22-369d-4b5d-84ee-54c4636a0edf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo88460d22-369d-4b5d-84ee-54c4636a0edf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo88460d22-369d-4b5d-84ee-54c4636a0edf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}