
{{- define "go-echo86c1d303-c926-4d4f-8fd6-30939e8f0500.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo86c1d303-c926-4d4f-8fd6-30939e8f0500.fullname" -}}
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


{{- define "go-echo86c1d303-c926-4d4f-8fd6-30939e8f0500.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo86c1d303-c926-4d4f-8fd6-30939e8f0500.labels" -}}
helm.sh/chart: {{ include "go-echo86c1d303-c926-4d4f-8fd6-30939e8f0500.chart" . }}
{{ include "go-echo86c1d303-c926-4d4f-8fd6-30939e8f0500.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo86c1d303-c926-4d4f-8fd6-30939e8f0500.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo86c1d303-c926-4d4f-8fd6-30939e8f0500.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}