
{{- define "go-echof61a5a71-9c5e-440f-bd2f-6de7c3a2d7ae.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof61a5a71-9c5e-440f-bd2f-6de7c3a2d7ae.fullname" -}}
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


{{- define "go-echof61a5a71-9c5e-440f-bd2f-6de7c3a2d7ae.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof61a5a71-9c5e-440f-bd2f-6de7c3a2d7ae.labels" -}}
helm.sh/chart: {{ include "go-echof61a5a71-9c5e-440f-bd2f-6de7c3a2d7ae.chart" . }}
{{ include "go-echof61a5a71-9c5e-440f-bd2f-6de7c3a2d7ae.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof61a5a71-9c5e-440f-bd2f-6de7c3a2d7ae.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof61a5a71-9c5e-440f-bd2f-6de7c3a2d7ae.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}