
{{- define "go-echof5c65a31-8f5e-47d3-9fe9-0f85a0f685ff.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof5c65a31-8f5e-47d3-9fe9-0f85a0f685ff.fullname" -}}
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


{{- define "go-echof5c65a31-8f5e-47d3-9fe9-0f85a0f685ff.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof5c65a31-8f5e-47d3-9fe9-0f85a0f685ff.labels" -}}
helm.sh/chart: {{ include "go-echof5c65a31-8f5e-47d3-9fe9-0f85a0f685ff.chart" . }}
{{ include "go-echof5c65a31-8f5e-47d3-9fe9-0f85a0f685ff.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof5c65a31-8f5e-47d3-9fe9-0f85a0f685ff.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof5c65a31-8f5e-47d3-9fe9-0f85a0f685ff.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}