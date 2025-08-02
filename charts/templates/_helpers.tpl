
{{- define "go-echo715f09ea-bdec-4a1c-962d-82d007077bfe.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo715f09ea-bdec-4a1c-962d-82d007077bfe.fullname" -}}
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


{{- define "go-echo715f09ea-bdec-4a1c-962d-82d007077bfe.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo715f09ea-bdec-4a1c-962d-82d007077bfe.labels" -}}
helm.sh/chart: {{ include "go-echo715f09ea-bdec-4a1c-962d-82d007077bfe.chart" . }}
{{ include "go-echo715f09ea-bdec-4a1c-962d-82d007077bfe.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo715f09ea-bdec-4a1c-962d-82d007077bfe.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo715f09ea-bdec-4a1c-962d-82d007077bfe.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}