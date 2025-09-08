
{{- define "go-echo3ef653cb-549b-4e58-ac35-ba8598b77c7e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3ef653cb-549b-4e58-ac35-ba8598b77c7e.fullname" -}}
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


{{- define "go-echo3ef653cb-549b-4e58-ac35-ba8598b77c7e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3ef653cb-549b-4e58-ac35-ba8598b77c7e.labels" -}}
helm.sh/chart: {{ include "go-echo3ef653cb-549b-4e58-ac35-ba8598b77c7e.chart" . }}
{{ include "go-echo3ef653cb-549b-4e58-ac35-ba8598b77c7e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3ef653cb-549b-4e58-ac35-ba8598b77c7e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3ef653cb-549b-4e58-ac35-ba8598b77c7e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}