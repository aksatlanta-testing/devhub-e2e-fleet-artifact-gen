
{{- define "go-echof3456baa-44ca-4239-b6f2-c0f71f5eb59d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof3456baa-44ca-4239-b6f2-c0f71f5eb59d.fullname" -}}
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


{{- define "go-echof3456baa-44ca-4239-b6f2-c0f71f5eb59d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof3456baa-44ca-4239-b6f2-c0f71f5eb59d.labels" -}}
helm.sh/chart: {{ include "go-echof3456baa-44ca-4239-b6f2-c0f71f5eb59d.chart" . }}
{{ include "go-echof3456baa-44ca-4239-b6f2-c0f71f5eb59d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof3456baa-44ca-4239-b6f2-c0f71f5eb59d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof3456baa-44ca-4239-b6f2-c0f71f5eb59d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}