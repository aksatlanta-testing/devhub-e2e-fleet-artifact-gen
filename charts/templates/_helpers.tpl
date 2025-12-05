
{{- define "go-echo2b851918-ea31-4ef8-8d5d-efa5b19c2f8e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2b851918-ea31-4ef8-8d5d-efa5b19c2f8e.fullname" -}}
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


{{- define "go-echo2b851918-ea31-4ef8-8d5d-efa5b19c2f8e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2b851918-ea31-4ef8-8d5d-efa5b19c2f8e.labels" -}}
helm.sh/chart: {{ include "go-echo2b851918-ea31-4ef8-8d5d-efa5b19c2f8e.chart" . }}
{{ include "go-echo2b851918-ea31-4ef8-8d5d-efa5b19c2f8e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2b851918-ea31-4ef8-8d5d-efa5b19c2f8e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2b851918-ea31-4ef8-8d5d-efa5b19c2f8e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}