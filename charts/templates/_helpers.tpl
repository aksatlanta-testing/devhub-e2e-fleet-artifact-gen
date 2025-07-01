
{{- define "go-echo85ed4368-6d24-4937-bddf-9aa90042450b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo85ed4368-6d24-4937-bddf-9aa90042450b.fullname" -}}
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


{{- define "go-echo85ed4368-6d24-4937-bddf-9aa90042450b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo85ed4368-6d24-4937-bddf-9aa90042450b.labels" -}}
helm.sh/chart: {{ include "go-echo85ed4368-6d24-4937-bddf-9aa90042450b.chart" . }}
{{ include "go-echo85ed4368-6d24-4937-bddf-9aa90042450b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo85ed4368-6d24-4937-bddf-9aa90042450b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo85ed4368-6d24-4937-bddf-9aa90042450b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}