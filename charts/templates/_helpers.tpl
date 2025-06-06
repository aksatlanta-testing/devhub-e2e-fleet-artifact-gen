
{{- define "go-echoe7cfea99-cc4e-4cb9-88a2-272d1d1e7aba.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe7cfea99-cc4e-4cb9-88a2-272d1d1e7aba.fullname" -}}
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


{{- define "go-echoe7cfea99-cc4e-4cb9-88a2-272d1d1e7aba.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe7cfea99-cc4e-4cb9-88a2-272d1d1e7aba.labels" -}}
helm.sh/chart: {{ include "go-echoe7cfea99-cc4e-4cb9-88a2-272d1d1e7aba.chart" . }}
{{ include "go-echoe7cfea99-cc4e-4cb9-88a2-272d1d1e7aba.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe7cfea99-cc4e-4cb9-88a2-272d1d1e7aba.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe7cfea99-cc4e-4cb9-88a2-272d1d1e7aba.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}