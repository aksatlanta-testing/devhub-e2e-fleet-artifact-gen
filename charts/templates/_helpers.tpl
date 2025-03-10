
{{- define "go-echo0e7c8169-7488-4090-919e-8749bf91c6cb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0e7c8169-7488-4090-919e-8749bf91c6cb.fullname" -}}
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


{{- define "go-echo0e7c8169-7488-4090-919e-8749bf91c6cb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0e7c8169-7488-4090-919e-8749bf91c6cb.labels" -}}
helm.sh/chart: {{ include "go-echo0e7c8169-7488-4090-919e-8749bf91c6cb.chart" . }}
{{ include "go-echo0e7c8169-7488-4090-919e-8749bf91c6cb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0e7c8169-7488-4090-919e-8749bf91c6cb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0e7c8169-7488-4090-919e-8749bf91c6cb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}