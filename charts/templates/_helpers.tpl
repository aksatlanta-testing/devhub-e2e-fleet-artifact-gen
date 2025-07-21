
{{- define "go-echoc4f4cc7c-1df4-4124-a298-a0bf1aea66a1.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc4f4cc7c-1df4-4124-a298-a0bf1aea66a1.fullname" -}}
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


{{- define "go-echoc4f4cc7c-1df4-4124-a298-a0bf1aea66a1.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc4f4cc7c-1df4-4124-a298-a0bf1aea66a1.labels" -}}
helm.sh/chart: {{ include "go-echoc4f4cc7c-1df4-4124-a298-a0bf1aea66a1.chart" . }}
{{ include "go-echoc4f4cc7c-1df4-4124-a298-a0bf1aea66a1.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc4f4cc7c-1df4-4124-a298-a0bf1aea66a1.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc4f4cc7c-1df4-4124-a298-a0bf1aea66a1.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}