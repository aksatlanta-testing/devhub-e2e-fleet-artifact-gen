
{{- define "go-echo3d5b10cc-4869-4bb2-87b6-3afcce5643ed.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3d5b10cc-4869-4bb2-87b6-3afcce5643ed.fullname" -}}
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


{{- define "go-echo3d5b10cc-4869-4bb2-87b6-3afcce5643ed.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3d5b10cc-4869-4bb2-87b6-3afcce5643ed.labels" -}}
helm.sh/chart: {{ include "go-echo3d5b10cc-4869-4bb2-87b6-3afcce5643ed.chart" . }}
{{ include "go-echo3d5b10cc-4869-4bb2-87b6-3afcce5643ed.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3d5b10cc-4869-4bb2-87b6-3afcce5643ed.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3d5b10cc-4869-4bb2-87b6-3afcce5643ed.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}