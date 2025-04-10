
{{- define "go-echo1d30a50e-9d89-493d-bfba-9c7d27e1e0ac.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1d30a50e-9d89-493d-bfba-9c7d27e1e0ac.fullname" -}}
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


{{- define "go-echo1d30a50e-9d89-493d-bfba-9c7d27e1e0ac.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1d30a50e-9d89-493d-bfba-9c7d27e1e0ac.labels" -}}
helm.sh/chart: {{ include "go-echo1d30a50e-9d89-493d-bfba-9c7d27e1e0ac.chart" . }}
{{ include "go-echo1d30a50e-9d89-493d-bfba-9c7d27e1e0ac.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1d30a50e-9d89-493d-bfba-9c7d27e1e0ac.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1d30a50e-9d89-493d-bfba-9c7d27e1e0ac.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}