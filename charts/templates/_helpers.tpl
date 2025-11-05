
{{- define "go-echo1bc3f6e2-215d-4d73-9d7a-9bc3f5695459.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1bc3f6e2-215d-4d73-9d7a-9bc3f5695459.fullname" -}}
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


{{- define "go-echo1bc3f6e2-215d-4d73-9d7a-9bc3f5695459.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1bc3f6e2-215d-4d73-9d7a-9bc3f5695459.labels" -}}
helm.sh/chart: {{ include "go-echo1bc3f6e2-215d-4d73-9d7a-9bc3f5695459.chart" . }}
{{ include "go-echo1bc3f6e2-215d-4d73-9d7a-9bc3f5695459.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1bc3f6e2-215d-4d73-9d7a-9bc3f5695459.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1bc3f6e2-215d-4d73-9d7a-9bc3f5695459.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}