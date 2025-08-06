
{{- define "go-echo6e753718-c17a-4e91-813a-0fb02d65ffcb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6e753718-c17a-4e91-813a-0fb02d65ffcb.fullname" -}}
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


{{- define "go-echo6e753718-c17a-4e91-813a-0fb02d65ffcb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6e753718-c17a-4e91-813a-0fb02d65ffcb.labels" -}}
helm.sh/chart: {{ include "go-echo6e753718-c17a-4e91-813a-0fb02d65ffcb.chart" . }}
{{ include "go-echo6e753718-c17a-4e91-813a-0fb02d65ffcb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6e753718-c17a-4e91-813a-0fb02d65ffcb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6e753718-c17a-4e91-813a-0fb02d65ffcb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}