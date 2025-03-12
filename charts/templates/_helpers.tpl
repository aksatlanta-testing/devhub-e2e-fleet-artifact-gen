
{{- define "go-echod86eb3b2-0ea8-4ecc-9f9c-d6506262c597.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod86eb3b2-0ea8-4ecc-9f9c-d6506262c597.fullname" -}}
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


{{- define "go-echod86eb3b2-0ea8-4ecc-9f9c-d6506262c597.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod86eb3b2-0ea8-4ecc-9f9c-d6506262c597.labels" -}}
helm.sh/chart: {{ include "go-echod86eb3b2-0ea8-4ecc-9f9c-d6506262c597.chart" . }}
{{ include "go-echod86eb3b2-0ea8-4ecc-9f9c-d6506262c597.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod86eb3b2-0ea8-4ecc-9f9c-d6506262c597.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod86eb3b2-0ea8-4ecc-9f9c-d6506262c597.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}