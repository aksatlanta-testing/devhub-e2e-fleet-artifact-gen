
{{- define "go-echo1a511290-68e1-45f3-a1ba-9f2c6da2c700.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1a511290-68e1-45f3-a1ba-9f2c6da2c700.fullname" -}}
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


{{- define "go-echo1a511290-68e1-45f3-a1ba-9f2c6da2c700.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1a511290-68e1-45f3-a1ba-9f2c6da2c700.labels" -}}
helm.sh/chart: {{ include "go-echo1a511290-68e1-45f3-a1ba-9f2c6da2c700.chart" . }}
{{ include "go-echo1a511290-68e1-45f3-a1ba-9f2c6da2c700.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1a511290-68e1-45f3-a1ba-9f2c6da2c700.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1a511290-68e1-45f3-a1ba-9f2c6da2c700.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}