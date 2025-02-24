
{{- define "go-echo3e659fba-d82d-4f3a-acaa-b8cb3ea358db.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3e659fba-d82d-4f3a-acaa-b8cb3ea358db.fullname" -}}
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


{{- define "go-echo3e659fba-d82d-4f3a-acaa-b8cb3ea358db.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3e659fba-d82d-4f3a-acaa-b8cb3ea358db.labels" -}}
helm.sh/chart: {{ include "go-echo3e659fba-d82d-4f3a-acaa-b8cb3ea358db.chart" . }}
{{ include "go-echo3e659fba-d82d-4f3a-acaa-b8cb3ea358db.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3e659fba-d82d-4f3a-acaa-b8cb3ea358db.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3e659fba-d82d-4f3a-acaa-b8cb3ea358db.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}