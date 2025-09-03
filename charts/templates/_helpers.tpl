
{{- define "go-echo9635c3ea-0ea5-4676-9197-3a51bdb1dc79.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9635c3ea-0ea5-4676-9197-3a51bdb1dc79.fullname" -}}
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


{{- define "go-echo9635c3ea-0ea5-4676-9197-3a51bdb1dc79.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9635c3ea-0ea5-4676-9197-3a51bdb1dc79.labels" -}}
helm.sh/chart: {{ include "go-echo9635c3ea-0ea5-4676-9197-3a51bdb1dc79.chart" . }}
{{ include "go-echo9635c3ea-0ea5-4676-9197-3a51bdb1dc79.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9635c3ea-0ea5-4676-9197-3a51bdb1dc79.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9635c3ea-0ea5-4676-9197-3a51bdb1dc79.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}