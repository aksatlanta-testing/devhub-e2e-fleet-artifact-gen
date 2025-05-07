
{{- define "go-echod382c1b6-e9b1-4c1d-b188-4b17784692d2.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod382c1b6-e9b1-4c1d-b188-4b17784692d2.fullname" -}}
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


{{- define "go-echod382c1b6-e9b1-4c1d-b188-4b17784692d2.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod382c1b6-e9b1-4c1d-b188-4b17784692d2.labels" -}}
helm.sh/chart: {{ include "go-echod382c1b6-e9b1-4c1d-b188-4b17784692d2.chart" . }}
{{ include "go-echod382c1b6-e9b1-4c1d-b188-4b17784692d2.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod382c1b6-e9b1-4c1d-b188-4b17784692d2.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod382c1b6-e9b1-4c1d-b188-4b17784692d2.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}