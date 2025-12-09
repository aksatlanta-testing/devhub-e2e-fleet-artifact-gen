
{{- define "go-echof2607a06-f70e-4fe8-9258-30364a8bae34.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof2607a06-f70e-4fe8-9258-30364a8bae34.fullname" -}}
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


{{- define "go-echof2607a06-f70e-4fe8-9258-30364a8bae34.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof2607a06-f70e-4fe8-9258-30364a8bae34.labels" -}}
helm.sh/chart: {{ include "go-echof2607a06-f70e-4fe8-9258-30364a8bae34.chart" . }}
{{ include "go-echof2607a06-f70e-4fe8-9258-30364a8bae34.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof2607a06-f70e-4fe8-9258-30364a8bae34.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof2607a06-f70e-4fe8-9258-30364a8bae34.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}