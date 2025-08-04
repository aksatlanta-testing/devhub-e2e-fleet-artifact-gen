
{{- define "go-echof7b2a2c4-b588-4d6f-8e9f-214c63d96601.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof7b2a2c4-b588-4d6f-8e9f-214c63d96601.fullname" -}}
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


{{- define "go-echof7b2a2c4-b588-4d6f-8e9f-214c63d96601.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof7b2a2c4-b588-4d6f-8e9f-214c63d96601.labels" -}}
helm.sh/chart: {{ include "go-echof7b2a2c4-b588-4d6f-8e9f-214c63d96601.chart" . }}
{{ include "go-echof7b2a2c4-b588-4d6f-8e9f-214c63d96601.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof7b2a2c4-b588-4d6f-8e9f-214c63d96601.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof7b2a2c4-b588-4d6f-8e9f-214c63d96601.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}