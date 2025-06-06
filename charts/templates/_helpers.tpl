
{{- define "go-echo7714396e-7de5-40f3-bbcd-0f9401a7bbcd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7714396e-7de5-40f3-bbcd-0f9401a7bbcd.fullname" -}}
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


{{- define "go-echo7714396e-7de5-40f3-bbcd-0f9401a7bbcd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7714396e-7de5-40f3-bbcd-0f9401a7bbcd.labels" -}}
helm.sh/chart: {{ include "go-echo7714396e-7de5-40f3-bbcd-0f9401a7bbcd.chart" . }}
{{ include "go-echo7714396e-7de5-40f3-bbcd-0f9401a7bbcd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7714396e-7de5-40f3-bbcd-0f9401a7bbcd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7714396e-7de5-40f3-bbcd-0f9401a7bbcd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}